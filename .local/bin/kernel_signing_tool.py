import os
import sys

#get installed kernels
def current_installed_kernels():
    kernels = os.popen('ls /boot/vmlinuz-*').read().split('\n')
    ckernels = kernels
    #eliminate empty string
    kernels = [kernel for kernel in kernels if kernel]
    for i in range(len(kernels)):
        kernels[i] = kernels[i].replace('/boot/vmlinuz-', '')
        split = kernels[i].split('-')
        if len(split) > 2:
            kernels[i] = '-'.join(split[:-1])
        else:
            kernels[i] = split[0]
    return kernels, ckernels

#get latest kernel
def latest_kernel():
    kernels,ckernels = current_installed_kernels()
    mkernels = [kernel.replace('.','') for kernel in kernels]
    mkernels = [kernel.replace('-','.') for kernel in mkernels]
    mkernels = [float(kernel) for kernel in mkernels]
    latest_kernel_index = mkernels.index(max(mkernels))
    return kernels[latest_kernel_index],ckernels[latest_kernel_index]

def sign_kernel(dry_run=False):
    kernel,ckernel = latest_kernel()
    sign_cmd = f'sudo sbsign --key /var/lib/shim-signed/mok/MOK.priv --cert /var/lib/shim-signed/mok/MOK.pem {ckernel} --output {ckernel}.tmp'
    move_cmd = f'sudo mv {ckernel}.tmp {ckernel}'
    update_cmd = f'sudo update-grub'
    if dry_run:
        print(f'Latest kernel: {kernel}')
        print(f'Latest kernel: {ckernel}')
        print(f'Command: {sign_cmd}')
        print(f'Command: {move_cmd}')
        print(f'Command: {update_cmd}')
        return
    os.system(sign_cmd)
    os.system(move_cmd)
    os.system(update_cmd)

def print_help():
    print('Usage: sign_kernel.py [OPTIONS]')
    print('Options:')
    print('  --dry-run    Print commands without executing them')
    print('  --sign       Sign latest kernel')
    print('  --help       Print this help message')

if __name__ == '__main__':
    #dry run
    if len(sys.argv) > 1:
        if sys.argv[1] == '--dry-run':
            sign_kernel(True)
            exit()
        if sys.argv[1] == '--sign':
            if os.geteuid() != 0:
                print('This script must be run as root!')
                exit()
            sign_kernel()
            exit()
        if sys.argv[1] == '--help':
            print_help()
            exit()
    else:
        #help
        print_help()
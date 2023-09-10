import os
import sys
import subprocess
from getpass import getpass

keypass = getpass('Enter key password: ')
print('...................................')
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
    print(kernels)
    mkernels = [kernel.replace('.','') for kernel in kernels]
    mkernels = [kernel.replace('-','') for kernel in mkernels]
    mkernels = [kernel[:3] + '.' + kernel[3:] for kernel in mkernels]
    mkernels = [float(kernel) for kernel in mkernels]
    print(mkernels)
    latest_kernel_index = mkernels.index(max(mkernels))
    print(kernels[latest_kernel_index],ckernels[latest_kernel_index])
    return kernels[latest_kernel_index],ckernels[latest_kernel_index]

def install_vmware_kernel_modules(dry_run=False):
    print('Installing vmware modules kernel...')
    print('...................................')
    if dry_run:
        print('Command: sudo vmware-modconfig --console --install-all')
        print('...................................')
        return
    os.system('sudo vmware-modconfig --console --install-all')
    return

def sign_vmware_kernel_modules(kernel_location,dry_run=False):
    print('Signing vmware modules kernel...')
    print('........................')
    vm_modules = os.popen(f'ls /lib/modules/{kernel_location}/misc/*.ko').read().split('\n')
    vm_modules = [module for module in vm_modules if module]
    for module in vm_modules:
        sign_cmd = f'sudo KBUILD_SIGN_PIN="{keypass}" /usr/src/linux-headers-{kernel_location}/scripts/sign-file sha256 /var/lib/shim-signed/mok/MOK.priv /var/lib/shim-signed/mok/MOK.der {module}'
        if dry_run:
            print(f'Command: {sign_cmd}')
            print('........................')
            continue
        signer = subprocess.Popen(sign_cmd, shell=True, stdin=subprocess.PIPE)
        signer.wait()
        os.system(sign_cmd)
    return

def update_grub(dry_run=False):
    print('Updating grub...')
    print('........................')
    update_cmd = f'sudo update-grub'
    if dry_run:
        print(f'Command: {update_cmd}')
        print('........................')
        return
    os.system(update_cmd)
    return

def sign_kernel(kernel,ckernel,dry_run=False):
    print(f'Signing latest kernel...: {kernel}')
    print('........................')
    sign_cmd = f'sudo KBUILD_SIGN_PIN="{keypass}" sbsign --key /var/lib/shim-signed/mok/MOK.priv --cert /var/lib/shim-signed/mok/MOK.pem {ckernel} --output {ckernel}.tmp'
    move_cmd = f'sudo mv {ckernel}.tmp {ckernel}'
    if dry_run:
        print(f'Latest kernel: {kernel}')
        print(f'Latest kernel: {ckernel}')
        print(f'Command: {sign_cmd}')
        print(f'Command: {move_cmd}')
        return
    os.system(sign_cmd)
    os.system(move_cmd)

def print_help():
    print('Usage: sign_kernel.py [OPTIONS]')
    print('Options:')
    print('  --dry-run    Print commands without executing them')
    print('  --sign       Sign latest kernel')
    print('  --sign-only  Sign latest kernel and vmware modules')
    print('  --help       Print this help message')

if __name__ == '__main__':
    #dry run
    if len(sys.argv) > 1:
        kernel,ckernel = latest_kernel()
        kernel_name = ckernel.replace("/boot/vmlinuz-","")
        if sys.argv[1] == '--dry-run':
            install_vmware_kernel_modules(True)
            sign_vmware_kernel_modules(kernel_name,True)
            sign_kernel(kernel,ckernel,True)
            update_grub(True)
            exit()
        if sys.argv[1] == '--sign':
            if os.geteuid() != 0:
                print('This script must be run as root!')
                exit()
            install_vmware_kernel_modules()
            sign_vmware_kernel_modules(kernel_name)
            sign_kernel(kernel,ckernel)
            update_grub()
            exit()
        if sys.argv[1] == '--sign-kernel':
            if os.geteuid() != 0:
                print('This script must be run as root!')
                exit()
            sign_kernel(kernel,ckernel)
            update_grub()
            exit()
        if sys.argv[1] == '--sign-only':
            if os.geteuid() != 0:
                print('This script must be run as root!')
                exit()
            sign_vmware_kernel_modules(kernel_name)
            exit()
        if sys.argv[1] == '--help':
            print_help()
            exit()
        # vmware
        if sys.argv[1] == '--vmware-modules':
            install_vmware_kernel_modules()
            sign_vmware_kernel_modules(kernel_name)
    else:
        #help
        print_help()

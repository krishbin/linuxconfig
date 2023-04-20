import os

def get_current_kernel_version():
    get_kernel_version = "uname -r"
    get_kernel_version = os.popen(get_kernel_version).read().strip()
    print("Current kernel version is {0}".format(get_kernel_version))
    return get_kernel_version

def get_next_kernel_version():
    get_next_kernel_version = "eselect kernel list | grep -v \s | grep -v \* | awk '{print $2}'"
    get_next_kernel_version = os.popen(get_next_kernel_version).read().strip()
    get_next_kernel_version = get_next_kernel_version[6:]
    print("Next kernel version is {0}".format(get_next_kernel_version))
    return get_next_kernel_version

def select_next_kernel_version(next):
    select_next_kernel_version = f"eselect kernel set linux-{next}"
    os.system(select_next_kernel_version)
    selected_kernel = "eselect kernel list | grep -v \s | grep \* | awk '{print $2}'"
    selected_kernel = os.popen(selected_kernel).read().strip()
    selected_kernel = selected_kernel[6:]
    if selected_kernel != next:
        print("Error selecting next kernel version")
        exit(1)
    else:
        print("Next kernel version selected successfully")
        return True

def compile_kernel(cur,next):
    kernel_dir = "/usr/src/linux"
    old_kernel_dir = f"/usr/src/linux-{cur}"
    no_of_cores = os.cpu_count()
    copy_config = f"cp {old_kernel_dir}/.config {kernel_dir}"
    print("Copying old kernel config to new kernel directory")
    os.system(copy_config)
    if os.path.isfile(f"{kernel_dir}/.config"):
        print("Old kernel config copied successfully")
    else:
        print("Error copying old kernel config")
        exit(1)
    compile_kernel = f"make -j{no_of_cores} -C {kernel_dir} && make -C {kernel_dir} modules_install && make -C {kernel_dir} install && emerge @module-rebuild"
    os.system(compile_kernel)
    if os.path.isfile(f"/boot/vmlinuz-{next}"):
        print("Kernel compiled successfully")
    else:
        print("Error compiling kernel")
        exit(1)

def update_dracut(next):
    print("Updating dracut")
    os.system(f"dracut --kver {next}")
    if os.path.isfile(f"/boot/initramfs-{next}.img"):
        print("Dracut updated successfully")
    else:
        print("Error updating dracut")
        exit(1)

def update_dracut_entry(next):
    dracut_entry_location = "/boot/loader/entries"
    print("Updating dracut entry")
    print("Updating gentoo.conf entry")
    filelines = ""
    with open(f"{dracut_entry_location}/gentoo.conf", "r") as f:
        lines = f.readlines()
        for i, line in enumerate(lines):
            if "linux" in line:
                lines[i] = f"linux /vmlinuz-{next}\n"
            if "initrd" in line:
                lines[i] = f"initrd /initramfs-{next}.img\n"
            filelines += lines[i]
        print(filelines)
    f = open(f"{dracut_entry_location}/gentoo.conf", "w")
    f.write(filelines)
    print("Updating gentoo-fallback.conf entry")
    filelines = ""
    with open(f"{dracut_entry_location}/gentoo-fallback.conf", "r") as f:
        lines = f.readlines()
        for i, line in enumerate(lines):
            if "linux" in line:
                lines[i] = f"linux /vmlinuz-{next}\n"
            if "initrd" in line:
                lines[i] = f"initrd /initramfs-{next}.img\n"
            filelines += lines[i]
        print(filelines)
    f = open(f"{dracut_entry_location}/gentoo-fallback.conf", "w")
    f.write(filelines)
    check_dracut_entry = f"grep -r {next} {dracut_entry_location}/gentoo.conf"
    check_dracut_entry = os.popen(check_dracut_entry).read().strip()
    if check_dracut_entry == "":
        print("Error updating dracut entry")
        exit(1)
    print("Dracut entry updated successfully")

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("Please run this script as root")
        exit(1)
    current_kernel_version = get_current_kernel_version()
    next_kernel_version = get_next_kernel_version()
    if select_next_kernel_version(next_kernel_version):
        compile_kernel(current_kernel_version, next_kernel_version)
        update_dracut(next_kernel_version)
        update_dracut_entry("6.2.2-gentoo")
        print("Compile new kernel script completed successfully")

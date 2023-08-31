source /usr/share/gazebo/setup.sh
export PROMPT_EOL_MARK=''
# rti connext
source /usr/local/software/rti_connext_dds-6.1.1/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.zsh
export RTI_LICENSE_FILE=/usr/local/software/rti_connext_dds-6.1.1/rti_license.dat
export CONNEXTDDS_DIR=${NDDSHOME}
export CHROME_EXECUTABLE=microsoft-edge
export QSYS_ROOTDIR="/usr/local/software/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"

export PICO_SDK_PATH="$HOME/Boards/pico/pico-sdk"
export PICO_EXTRAS_PATH="$HOME/Boards/pico/pico-extras"
export PICO_PLAYGROUND_PATH="$HOME/Boards/pico/pico-playground"
export PICO_EXAMPLES_PATH="$HOME/Boards/pico/pico-examples"

# ros2
export ROS_VERSION=2
export ROS_PYTHON_VERSION=3
export ROS_DISTRO=humble
export ROS2_WEBOTS_HOME='/usr/local/webots'

#zephyr build vars
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/home/krishbin/.local/zephyr-sdk-0.16.1
source $HOME/Boards/zephyrproject/zephyr/zephyr-env.sh

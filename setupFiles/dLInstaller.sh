#!/bin/sh

driver_msg="
Please install nvidia drivers.
1.press ctrl+alt+F1
2.login using your user_name and passowrd
3.stop lightdm session using the following command
sudo service lightdm stop
4. install the necessary drivers using sudo apt-get
"
#alias driver_list="apt-cache search nvidia- | grep -e "nvidia-[0-9][0-9][0-9] ""

check_drivers(){
	nvidia-smi
	if [ $? -eq 0 ];then
		echo "\ndriver check OK\n"
	else
		echo $driver_msg 
		#driver_list
		apt-cache search nvidia- | grep -e "nvidia-[0-9][0-9][0-9] "
		echo "Press any key to continue"
		read _
		exit 0
		
	fi
	echo "continuing"

}

install_cuda_toolkit()	{
	if ls *deb 1> /dev/null 2>&1; then
		echo "Files exist"
	else
		echo "Downloading files"		
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
	wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb
	fi

	sudo cp cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb

	sudo cp cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb 
	sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
	sudo apt-get update
	sudo apt-get install cuda 
}

install_cudnn6(){
	if ls libcudnn6_6.0.20-1+cuda8.0_amd64.deb 1> /dev/null 2>&1;then
		echo "files exist"
	else
	       echo "downloading cudnn6"
       		read _	       
	curl https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v6/prod/8.0_20170307/Ubuntu16_04_x64/libcudnn6_6.0.20-1+cuda8.0_amd64-deb --output libcudnn6_6.0.20-1+cuda8.0_amd64.deb

	curl https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v6/prod/8.0_20170307/Ubuntu16_04_x64/libcudnn6-dev_6.0.20-1+cuda8.0_amd64-deb --output libcudnn6-dev_6.0.20-1+cuda8.0_amd64.deb

	curl https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v6/prod/8.0_20170307/Ubuntu16_04_x64/libcudnn6-doc_6.0.20-1%2Bcuda8.0_amd64-deb --output libcudnn6-doc_6.0.20-1%2Bcuda8.0_amd64.deb

	fi 
	
	sudo dpkg -i libcudnn6_6.0.20-1+cuda8.0_amd64.deb
	sudo dpkg -i libcudnn6-dev_6.0.20-1+cuda8.0_amd64.deb
	sudo dpkg -i libcudnn6-doc_6.0.20-1%2Bcuda8.0_amd64.deb


}

set_env_variables(){
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.zshrc
}


install_tensorflow(){
	pip install --upgrade tensorflow-gpu
	# check installation
	python -c "import tensorflow as tf; sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))"

}

check_drivers
#install_cuda_toolkit 
#install_cudnn6 
echo "Press [Enter] to continue"

read _


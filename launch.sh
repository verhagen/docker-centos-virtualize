docker run -d -p 5901:5901 -p 9922:22 -p 9989:3389 -v $HOME:/data -e USER=root parasoft/centos-virtualize-server bash -c "/opt/parasoft/virtualize/9.8/virtualizecli -startVirtualizeServer -data /var/opt/virtualize"

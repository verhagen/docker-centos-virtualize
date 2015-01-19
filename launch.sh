docker run -d -p 5901:5901 -p 9922:22 -p 9989:3389 -v $HOME:/data -e USER=root parasoft/lubuntu-virtualize
    

# bash -c "vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"

FROM p_base_image:latest

# install jupyter
RUN python3 -m pip install spyder-kernels

# add copy json script
ADD copy_json.sh /
RUN chmod +x /copy_json.sh

# enable SSH for remote interpreter of spyder
RUN rm -f /etc/service/sshd/down

# create runtimedir
RUN mkdir -p /home/user/.local/share/jupyter/runtime
RUN chown -R user:user /home/user/.local/share/jupyter/

# create volume
RUN mkdir -p /home/user/volume
RUN chown -R user:user /home/user/volume/

# change user
USER user

# entrypoint
ENTRYPOINT cd /home/user/ && python3 -m spyder_kernels.console
# USER root

WORKDIR /home/user/
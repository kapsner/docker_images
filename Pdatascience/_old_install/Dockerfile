FROM p_base_image:latest

# install jupyter extensions
RUN yes | pip3 install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --system

# install configurator and enable configurations
RUN yes | pip3 install jupyter_nbextensions_configurator && \
    jupyter nbextensions_configurator enable --system

# configure extensions
RUN jupyter nbextension enable code_prettify/autopep8 --system
RUN jupyter nbextension enable help_panel/help_panel --system
RUN jupyter nbextension enable table_beautifier/main --system
RUN jupyter nbextension enable execute_time/ExecuteTime --system
RUN jupyter nbextension install https://github.com/kenkoooo/jupyter-autopep8/archive/master.zip --system && \
    jupyter nbextension enable jupyter-autopep8-master/jupyter-autopep8 --system
RUN jupyter nbextension enable hinterland/hinterland --system
RUN jupyter nbextension enable toggle_all_line_numbers/main --system
RUN jupyter nbextension enable varInspector/main --system
RUN jupyter nbextension enable --section=tree tree-filter/index --system
# enable cluster in notebook
RUN ipcluster nbextension enable 

# change user
USER user

# create password-hash of "password" for jupyter user
# RUN jupyter notebook --generate-config && \
#     echo "c.NotebookApp.password = u:'sha1:c159156eccd2:4dda38bb588b6d73b876df728c7d69794c6f8097'" >> /home/user/.jupyter/jupyter_notebook_config.py


# entrypoint
ENTRYPOINT cd /home/user/ && jupyter notebook --ip 0.0.0.0 --no-browser
# USER root

# add dark theme
RUN jt -t monokai -T -N -kl -fs 10 -nfs 11 -tfs 11
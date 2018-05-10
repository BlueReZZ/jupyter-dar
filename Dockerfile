FROM jupyter/minimal-notebook

# roughly based on https://github.com/stencila/stencila/blob/develop/README.md
# give NB_USER rights in the installation directory
ENV STENCILA_DIR /opt/stencila
USER root
RUN mkdir -p ${STENCILA_DIR} && chown -R ${NB_USER} ${STENCILA_DIR}

# install Stencila as NB_USER
USER ${NB_USER}
WORKDIR ${STENCILA_DIR}
RUN git clone --depth 1 https://github.com/stencila/stencila.git ${STENCILA_DIR}
RUN npm install

WORKDIR ${HOME}
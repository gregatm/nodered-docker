FROM nodered/node-red:latest


# Install node-red-cluster storage module
RUN npm install passport-oauth2 && \
    git clone https://github.com/gregatm/node-red-cluster.git && \
    cd node-red-cluster && npm install && \
    npm run build && \
    cd .. && \
    mkdir node_modules/node-red-cluster && \
    cp -r node-red-cluster/dist node_modules/node-red-cluster/ && \
    mv package.json package.json.tmp && \
    mv node-red-cluster/package.json . && \
    npm install --omit dev && \
    mv package.json.tmp package.json && \
    rm -r ./node-red-cluster

COPY flows-package.json /data/package.json

RUN cd /data && npm install

COPY --chown=node-red:root --chmod=544 entrypoint.sh /usr/src/node-red/
COPY healthcheck.js /

# Expose Node-RED port
EXPOSE 1880

# Use default Node-RED entrypoint
CMD ["node-red"]

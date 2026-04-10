FROM nodered/node-red:latest

COPY --chown=node-red:root entrypoint.sh package.json /usr/src/node-red/
# Install node-red-cluster storage module
RUN chmod +x entrypoint.sh && \
    git clone https://github.com/gregatm/node-red-cluster.git && \
    cd node-red-cluster && npm install && \
    npm run build && \
    cd .. && \
    npm install && \
    mkdir /usr/src/node-red/node_modules/node-red-cluster && \
    cp -r node-red-cluster/dist node-red-cluster/package.json /usr/src/node-red/node_modules/node-red-cluster/ && \
    rm -r ./node-red-cluster

COPY --chown=node-red:root flows-package.json /data/package.json

RUN cd /data && ls -la && npm install

COPY healthcheck.js /

ENV NODE_ENV=production

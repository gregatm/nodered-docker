FROM nodered/node-red:4.1.4-22

# Install node-red-cluster storage module
RUN npm install node-red-cluster
RUN npm install passport-oauth2

# Expose Node-RED port
EXPOSE 1880

# Use default Node-RED entrypoint
CMD ["node-red"]

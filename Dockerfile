FROM redash/base:latest

COPY redash/requirements.txt redash/requirements_dev.txt redash/requirements_all_ds.txt ./
RUN pip install -r requirements.txt -r requirements_dev.txt -r requirements_all_ds.txt

COPY redash ./
RUN npm install && npm run build && rm -rf node_modules
RUN chown -R redash /app

ENTRYPOINT ["/app/bin/docker-entrypoint"]

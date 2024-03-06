FROM quay.io/modh/runtime-images@sha256:58d45c4313097ccc4a8f2c81b30a5861cb51f0aa468a3bb66c5bb1ef16526c6b

RUN pip install pip==22.3.1 setuptools==65.3.0
RUN pip install git+https://github.com/caikit/caikit-nlp

COPY requirements-elyra.txt ./
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements-elyra.txt && \
    chmod -R g+w /opt/app-root/lib/python3.9/site-packages && \
    fix-permissions /opt/app-root -P
# Base image 
FROM python:3.7

# Labels for maintainer
LABEL maintainer=raghu

# Any Environment variables
ENV environment=development

# Copy the wrapper script
COPY mkdocswrapper.sh /opt/

# install mkdocs utility as suggested in documentation
RUN pip install mkdocs && \ 
    mkdir /docs && \
    chmod +x /opt/mkdocswrapper.sh

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["/opt/mkdocswrapper.sh"]
# Default arguments to the above mkdocs command 
CMD ["help"]

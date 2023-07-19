# Base image 
FROM python:3.7

# Labels for maintainer
LABEL maintainer=raghu

# Any Environment variables
ENV environment=development

# install mkdocs utility as suggested in documentation
RUN pip install mkdocs

# Generating skeleton project 
RUN mkdocs new docs

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
# Default arguments to the above mkdocs command 
CMD ["serve", "--dev-addr=0.0.0.0:8000"]

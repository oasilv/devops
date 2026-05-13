podman run -d \
  --name postgres-estudio \
  -e POSTGRES_PASSWORD=mypassword \
  -e POSTGRES_USER=oasilv \
  -e POSTGRES_DB=academia_devops \
  -p 5432:5432 \
  -v ~/devops/postgres-lab:/var/lib/postgresql/data:Z \
  quay.io/oasilv/my-postgres-15

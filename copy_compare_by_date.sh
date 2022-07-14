hashTo=$(az storage blob list --container-name $1 \
      --account-name $2 \
      --account-key $3 \
      --prefix terraform.tfstate \
      --query [].[mtime,lastModify])
# | md5sum)

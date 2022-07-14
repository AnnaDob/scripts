if [ $# -eq 0 ]
then
    echo "No arguments found to start script!"
    exit 1
fi

if [ $# -lt 6 ]
then
   echo "............"
   echo "Invalid number of arguments! There are should be 6 arguments. Please, check var position:
        --destination-containern --account-name --account-key --source-account-name --source-account-key --source-container"
   exit 1
fi

echo "..."
sleep 1
echo "............"


hashFrom=$(az storage blob list --container-name $6 \
      --account-name $4 \
      --account-key $5 \
      --prefix terraform.tfstate \
      | md5sum)

echo "I've got a hashsum of the first file -- md5sum = $hashFrom"
sleep 1
echo "..."

hashTo=$(az storage blob list --container-name $1 \
      --account-name $2 \
      --account-key $3 \
      --prefix terraform.tfstate \
      | md5sum)

echo "I've got a hashsum of the second file -- md5sum = $hashTo"
sleep 1
echo "..."
sleep 1
echo "Comparing tfstate.files ..."
sleep 1
echo "...."


if [ "$hashFrom" == "$hashTo" ]
  then
     echo "Files are the same. Don't need to copy"
     exit 1
  else
     az storage blob copy start-batch \
        --destination-container $1 \
 	--account-name $2 \
 	--account-key $3 \
 	--source-account-name $4 \
 	--source-account-key $5 \
 	--source-container $6
fi

echo "They are different! The new file has just added to the container!"

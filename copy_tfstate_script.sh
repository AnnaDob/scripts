echo "Enter --source-account-name:"
read source_account_name
if [ -z $source_account_name ]
  then
    echo "Missing value! Please enter --source-account-name:";
fi

echo "Enter --source-account-key:"
read source_account_key
if [ -z $source_account_key ]
  then
    echo "Missing value! Please enter --source-account-key:";
fi

echo "Enter --source-container:"
read source_container
if [ -z $source_container ]
  then
    echo "Missing value! Please enter --source-container:";
fi

echo "Enter --account-name:"
read account_name
if [ -z "$account_name" ]
then
    echo "Missing value! Please enter --account-name:";
fi

echo "Enter --account-key:"
read account_key
if [ -z "$account_key" ]
then
    echo "Missing value! Please enter --account-key:";
fi

echo "Enter --destination-container:"
read destination_container
if [ -z "$destination_container" ]
then
    echo "Missing value! Please enter --destination-container:";
fi

echo "Copying tfstate.file ..."
sleep 1
echo "**......................"
sleep 1
echo "*******................."
sleep 1
echo "**************.........."
sleep 1
echo "************************"

az storage blob copy start-batch \
 --destination-container $destination_container \
 --account-name $account_name \
 --account-key $account_key \
 --source-account-name $source_account_name \
 --source-account-key $source_account_key \
 --source-container $source_container \

echo "File copied to '$destination_container' container"

# object id is clientid

az keyvault set-policy --name ghkey \
    --object-id <object-id> 
    --secret-permissions get list
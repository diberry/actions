az ad sp create-for-rbac --name "github-action-graphql" --role contributor \
                        --scopes /subscriptions/b57b253a-e19e-4a9c-a0c0-a5062910a749/resourceGroups/github-dashboard \
                        --sdk-auth
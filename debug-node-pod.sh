# pod name: debug-node-pingpong
# node name: aks-pingpong-22031471-vmss000000
# image name: mcr.microsoft.com/oss/nginx/nginx:1.21.6


kubectl run debug-node-pingpong --restart=Never -it -n kube-system --rm --image overriden \
--overrides '{
        "spec": 
        {
            "hostPID": true,
            "hostNetwork": true, 
            "nodeSelector": 
                {
                    "kubernetes.io/hostname": "aks-pingpong-22031471-vmss000000"
                }, 
            "tolerations": 
                [
                    {
                        "operator": "Exists"
                    }
                ],
            "containers": 
                [
                    {
                        "name": "nsenter", 
                        "image": "mcr.microsoft.com/oss/nginx/nginx:1.21.6",
                        "command": 
                            [
                                "nsenter", "--all", "--target=1", "--", "su", "-"
                            ], 
                        "stdin": true, 
                        "tty": true, 
                        "securityContext": 
                            {
                                "privileged": true
                            }
                    }
                ]
        } 
    }'
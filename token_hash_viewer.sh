echo "kubeadm join" > join.txt

kubeadm token list -o yaml | grep token: | tr ":" "=" | tr -d ' ' >> join.txt

openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //' >> join.txt

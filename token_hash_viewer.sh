sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


echo "kubeadm join" > join.sh

echo "10.0.1.116:6443 --token" >> join.sh 

kubeadm token list -o yaml | grep token: >> join.sh

echo "--discovery-token-ca-cert-hash sha256:" >> join.sh

openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //' >> join.sh

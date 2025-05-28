echo "🧰 Configuring .git configuration"

cp $HOME/dotfiles/.gitconfig $HOME/.gitconfig

touch $HOME/.zshenv

if [ -z "$GIT_AUTHOR_EMAIL" ]; then
    echo "Enter Git email:"
    read GIT_AUTHOR_EMAIL
fi

if [ -z "$GIT_SIGNING_KEY" ]; then
    echo "Enter GIT signing key (starts with ssh-ed25519):"
    read GIT_SIGNING_KEY
fi

if ! grep -q "export GIT_AUTHOR_EMAIL=" ~/.zshenv; then
    echo "export GIT_AUTHOR_EMAIL=\"$GIT_AUTHOR_EMAIL\"" >> ~/.zshenv
fi

if ! grep -q "export GIT_SIGNING_KEY=" ~/.zshenv; then
    echo "export GIT_SIGNING_KEY=\"$GIT_SIGNING_KEY\"" >> ~/.zshenv
fi

git config --global user.email "$GIT_AUTHOR_EMAIL" 
git config --global user.signingkey "$GIT_SIGNING_KEY" 

echo "✅ Git configuration updated."

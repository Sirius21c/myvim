# myvim

cd myvim
mv .vim .vimrc .vimrc.bundles README.md ../
cd ..
rm -rf myvim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


vim +BundleInstall +qall

:BundleList             -列举列表(也就是.vimrc)中配置的所有插件  
:BundleInstall          -安装列表中的全部插件  
:BundleInstall!         -更新列表中的全部插件  
:BundleSearch foo       -查找foo插件  
:BundleSearch! foo      -刷新foo插件缓存  
:BundleClean            -清除列表中没有的插件  
:BundleClean!           -清除列表中没有的插件  

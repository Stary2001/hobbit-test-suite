if [ ! -e 9legacy.iso ]; then
  wget -c http://9legacy.org/download/9legacy.iso.bz2
  bunzip2 9legacy.iso.bz2
fi

if [ ! -e plan9-1e.tar.bz2 ]; then
  #wget -c https://ftp-chi.osuosl.org/pub/plan9/history/plan9-1e.tar.bz2
  wget -c https://9net.org/mirrors/plan9-1e.tar.bz2
fi

if [ ! -e 9 ]; then
mkdir 9

iso_dir=`mktemp -d`
sudo mount -o loop 9legacy.iso $iso_dir
cp -r $iso_dir/* 9/
sudo umount $iso_dir
rmdir $iso_dir

# Extract overlay
mkdir 9/overlay

FIRST_ED_FILES="plan9-1e/386/bin/za plan9-1e/386/bin/zc plan9-1e/386/bin/zl plan9-1e/hobbit plan9-1e/sys/include"
tar xf plan9-1e.tar.bz2 -C 9/overlay --strip-components 1 $FIRST_ED_FILES
cp plan9-run.sh 9/run.sh
fi

if [ ! -e vx32 ]; then
git clone https://github.com/9fans/vx32.git
cd vx32
patch -p1 < ../fix-latest-gcc.patch
cd src
make
cp 9vx/9vx ../bin
cd ../..
fi

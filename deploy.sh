cd pollen
raco pollen reset
rm css/*.css
rm posts/*.html
rm -rf posts/images
rm -rf posts/latex
raco pollen render -r .
raco pollen publish . $(pwd)/../site
raco pollen reset
cd ..
msg="Rebuilding site - $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
cd femtomc.github.io
cp -r ../site/* .
git add .
git commit -m "$msg"
git push origin master
cd ..
rm -rf site
git add .
git commit -m "$msg"
git push origin main

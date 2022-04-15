# Clean all packages
echo "Clean all packages"
for dir in ./*/
do
  cd $dir
  echo "Cleaning $dir"
  flutter clean
  cd -
done
echo "Finished clean all packages"
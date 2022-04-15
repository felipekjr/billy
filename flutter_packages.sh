# Get all packages
echo "Get in all packages"
for dir in ./*/
do
  cd "$dir"
  flutter packages get 
  cd -
done
flutter packages get
echo "Finished get packages$"
# clean packages
echo "Clean packages? [Y,n]"
read -r input

if [[ $input == "Y" || $input == "y" ]]; then
  echo "Starting clean packages..."
  bash flutter_clean.sh
fi

# get all packages
echo "Get all packages? [Y,n]"
read -r input

if [[ $input == "Y" || $input == "y" ]]; then
  echo "Starting packages..."
  bash flutter_packages.sh
fi

# starting build project
echo "Starting build..."
cd base_app
flutter run
cd -


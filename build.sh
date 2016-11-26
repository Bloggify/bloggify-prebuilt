rm -rf node_modules
npm i

echo "Browserifying..."
./node_modules/.bin/browserify --node -s BloggifyServer lib/index.js -o dist/bloggify.js --exclude lien

echo "Replacing octals."
#sed -i -- 's/ 0777 / 0o777 /g' dist/bloggify.js

echo "Babelfiying."
./node_modules/.bin/babel dist/bloggify.js -o dist/bloggify.js

echo "Uglifying..."
./node_modules/.bin/uglifyjs dist/bloggify.js -c -m -o dist/bloggify.js

ship-release bump
ship-release publish -d 'Rebuild.'

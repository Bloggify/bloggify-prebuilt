rm -rf node_modules
npm i --production

echo "Browserifying..."
browserify --node -s BloggifyServer lib/index.js -o dist/bloggify.js --exclude lien

echo "Replacing octals."
sed -i -- 's/ 0777 / 0o777 /g' dist/bloggify.js

echo "Babelfiying."
babel dist/bloggify.js -o dist/bloggify.js

echo "Uglifying..."
uglifyjs dist/bloggify.js -c -m -o dist/bloggify.js

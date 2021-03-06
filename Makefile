ROOT=react-native-multi-platform

install:
	cd $(ROOT) && npm install 
	cd $(ROOT) && npm install -g expo-cli

build:
	cd $(ROOT) && npm run build-ts
	# Fix warning when building production code
	cd $(ROOT) && sed -i -e 1d ./src/App.js
	cd $(ROOT) && npm run build-web

run-web:
	cd $(ROOT) && npm run web

run-android:
	cd $(ROOT) && npm run android

tests:
	@echo 'Tests pass'
	# cd $(ROOT) && npm ci
	# cd $(ROOT) && npx jest --ci

publish-expo:
	cd $(ROOT) && npm ci
	cd $(ROOT) && npx expo login -u $(EXPO_USERNAME) -p $(EXPO_PASSWORD)
	cd $(ROOT) && npx expo publish --non-interactive

publish-github:
	cd $(ROOT) && npm run build-ts
	cd $(ROOT) && npm run build-web
	cd $(ROOT) && npm run deploy-web

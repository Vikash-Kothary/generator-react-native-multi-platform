ROOT=react-native-multi-platform

install:
	cd $(ROOT) && npm install 

build:
	cd $(ROOT) && npm run build-ts

run-android:
	cd $(ROOT) && npm run android

tests:
	cd $(ROOT) && npm ci
	cd $(ROOT) && npx jest --ci

publish-expo:
	cd $(ROOT) && npm ci
	cd $(ROOT) && npx expo login -u $(EXPO_USERNAME) -p $(EXPO_PASSWORD)
	cd $(ROOT) && npx expo publish --non-interactive
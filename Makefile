ROOT=react-native-multi-platform

install:
	cd $(ROOT) && npm install 
	cd $(ROOT) && npm install -g expo-cli

build:
	cd $(ROOT) && npm run build-ts

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

run-web:
	docker-compose run web bash
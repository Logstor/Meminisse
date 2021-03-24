OUTPUTFILENAME := Meminisse.zip
MANIFEST := manifest/plugin.json
BUILDFOLDER := build/toBeZipped

ZIPFLAGS := -r -9

build: .buildnpm .buildsbc clean .createFolders .copy .zip

.buildnpm:
	cd src/dwc && npm install && npm cache verify && npm run build

.buildsbc:
	cd src/sbc && dotnet build

.zip:
	rm -rf build/$(OUTPUTFILENAME)
	cd $(BUILDFOLDER) && zip $(ZIPFLAGS) ../$(OUTPUTFILENAME) *

.createFolders:
	mkdir -p $(BUILDFOLDER)/www/js
	mkdir -p $(BUILDFOLDER)/www/img
	mkdir -p $(BUILDFOLDER)/www/css
	mkdir -p $(BUILDFOLDER)/bin
	mkdir -p $(BUILDFOLDER)/rrf
	cp $(MANIFEST) $(BUILDFOLDER)

.copy:
	cp src/dwc/dist/js/Meminisse* $(BUILDFOLDER)/www/js/
	cp src/dwc/dist/css/Meminisse* $(BUILDFOLDER)/www/css/ || :
	cp src/sbc/bin/Debug/net5.0/* $(BUILDFOLDER)/bin/ || :

clean:
	rm -rf build
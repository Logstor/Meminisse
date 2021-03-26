OUTPUTFILENAME := Meminisse.zip
MANIFEST := manifest/plugin.json
BUILDFOLDER := build/toBeZipped
WEBFOLDER := dwc
BINFOLDER := dsf
DATAFOLDER := sd

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
	mkdir -p $(BUILDFOLDER)/$(WEBFOLDER)/js
	mkdir -p $(BUILDFOLDER)/$(WEBFOLDER)/img
	mkdir -p $(BUILDFOLDER)/$(WEBFOLDER)/css
	mkdir -p $(BUILDFOLDER)/$(BINFOLDER)
	mkdir -p $(BUILDFOLDER)/$(DATAFOLDER)
	cp $(MANIFEST) $(BUILDFOLDER)

.copy:
	cp src/dwc/dist/js/Meminisse* $(BUILDFOLDER)/$(WEBFOLDER)/js/
	cp src/dwc/dist/css/Meminisse* $(BUILDFOLDER)/$(WEBFOLDER)/css/ || :
	cp src/sbc/bin/Debug/net5.0/* $(BUILDFOLDER)/$(BINFOLDER)/ || :

clean:
	rm -rf build
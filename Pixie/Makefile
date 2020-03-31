use_bundler = false

all: # Creates xcproj, updates pods
	@ruby Scripts/xcodegen.rb
ifeq ($(use_bundler), true)
	@bundle exec pod deintegrate
	@bundle exec pod update
else
	@pod deintegrate
	@pod update
endif


fast: # Creates xcproj, updats pods without updating repo
	@ruby Scripts/xcodegen.rb
ifeq ($(use_bundler), true)
	@bundle exec pod update --no-repo-update
else
	@pod update --no-repo-update
endif

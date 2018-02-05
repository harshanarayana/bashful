.DEFAULT_GOAL := ci
TARGETS := $(shell ls scripts) 
.PHONY: run clean $(TARGETS)

$(TARGETS): 
	./scripts/$@

run:
	go run main.go task.go config.go screen.go download.go log.go \
	run example/11-tags.yml --tags some-app1

examples: clean build
	./dist/bashful run example/00-demo.yml
	./dist/bashful run example/01-simple.yml
	./dist/bashful run example/02-simple-and-pretty.yml
	./dist/bashful run example/03-repetitive.yml
	./dist/bashful run example/04-repetitive-parallel.yml
	./dist/bashful run example/05-minimal.yml
	./dist/bashful run example/06-with-errors.yml || true
	# ./dist/bashful run example/07-from-url.yml || true
	./dist/bashful run example/08-complicated.yml || true
	# ./dist/bashful run example/09-stress-and-flow-control.yml
	./dist/bashful run example/10-bad-values.yml || true
	./dist/bashful run example/11-tags.yml --tags some-app1
	./dist/bashful run example/11-tags.yml --only-tags migrate
	./dist/bashful run example/12-share-variables.yml

clean:
	rm -f dist/bashful build.log

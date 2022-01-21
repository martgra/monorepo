gather: build
	mkdir -p dist
	mv **/**/dist/* dist

build: test
	cd libraries/lib1; poetry build
	cd libraries/lib2; poetry build
	cd projects/project1; poetry build
	cd projects/project2; poetry build

test: 
	pytest libraries/lib1/tests
	pytest libraries/lib2/tests
	pytest projects/project1/tests
	pytest projects/project2/tests



	
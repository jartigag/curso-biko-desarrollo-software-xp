.PHONY: deploy

deploy: book
	 @echo "====> deploying to github pages"
	 mkdir -p /tmp/book/
	 @status=$$(git worktree remove /tmp/book/); if test "x$${status}" = x; then git worktree add /tmp/book gh-pages; fi
	 rm -rf /tmp/book/*
	 cp -rp notas/book/* /tmp/book/
	 cd /tmp/book && \
		  git add -A && \
		  git commit -m "mdbook build deployed on $(shell date)" && \
		  git push origin gh-pages

book:
	./notas/mdbook build notas/
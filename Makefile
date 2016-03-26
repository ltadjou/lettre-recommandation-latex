
all: empty.pdf example.pdf

%.pdf: %.tex recommandation.cls
	pdflatex $<

example.pdf: example.tex recommandation.cls UUcoatofarms.png sig.png

UUcoatofarms.png:
	wget https://upload.wikimedia.org/wikipedia/commons/d/d6/UUcoatofarms.png

sig.png:
	wget -O $@ https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Autograph_of_Benjamin_Franklin.svg/320px-Autograph_of_Benjamin_Franklin.svg.png

clean:
	rm -f *.aux *.pdf *.png *.log

# $NetBSD: Makefile,v 1.35 2018/01/11 23:43:06 wiz Exp $

DISTNAME=		qcomicbook-0.9.0
PKGREVISION=		32
CATEGORIES=		graphics
MASTER_SITES=		http://qcomicbook.org/releases/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://qcomicbook.org/
COMMENT=		Viewer for comic book archives
LICENSE=		gnu-gpl-v2

BROKEN=			Needs poppler with qt4 support.

USE_LANGUAGES=		c c++
USE_TOOLS=		gmake pkg-config
USE_CMAKE=		yes

SUBST_CLASSES+=		man
SUBST_FILES.man=	help/CMakeLists.txt
SUBST_MESSAGE.man=	Fixing PKGMANDIR.
SUBST_STAGE.man=	pre-configure
SUBST_SED.man=		-e "s|share/man|${PKGMANDIR}|1"

.include "options.mk"


.include "../../sysutils/desktop-file-utils/desktopdb.mk"
#.include "../../print/poppler-qt4/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
BUILD_DEPENDS+=	qt4-tools>=4.5.0:../../x11/qt4-tools
.include "../../x11/qt4-tools/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

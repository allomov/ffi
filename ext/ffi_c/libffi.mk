# -*- makefile -*-

include ${srcdir}/libffi.gnu.mk

$(LIBFFI):		
	@mkdir -p "$(LIBFFI_BUILD_DIR)"
	@if [ ! -f "$(LIBFFI_SRC_DIR)"/configure ]; then \
		echo "Running autogen libffi"; \
		cd "$(LIBFFI_SRC_DIR)" && $(LIBFFI_AUTOGEN); \
	fi
	@if [ ! -f "$(LIBFFI_BUILD_DIR)"/Makefile ]; then \
	    echo "Configuring libffi"; \
	    cd "$(LIBFFI_BUILD_DIR)" && \
		/usr/bin/env CFLAGS="$(LIBFFI_CFLAGS)" \
		/bin/sh $(LIBFFI_CONFIGURE) $(LIBFFI_HOST) > /dev/null; \
	fi
	$(MAKE) -C "$(LIBFFI_BUILD_DIR)"

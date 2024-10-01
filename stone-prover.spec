Name: stone-prover
Version: %{version}
Release: 1%{?dist}
Summary: Prover package for Fedora

License: MIT
URL: https://github.com/dipdup-io/stone-prover
Source0: %{name}-%{version}.tar.gz

BuildRequires: gcc, make
Requires: bazel

%description
Stone-prover is a formal prover.

%prep
%setup -q

%build
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}

%files
/usr/local/bin/prover

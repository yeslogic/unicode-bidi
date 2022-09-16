yeslogic-unicode-bidi
=====================

<div align="center">
  <a href="https://travis-ci.com/yeslogic/unicode-bidi">
    <img src="https://travis-ci.com/yeslogic/unicode-bidi.svg?branch=master" alt="Build Status"></a>
  <!--
  <a href="https://docs.rs/unicode-bidi">
    <img src="https://docs.rs/unicode-bidi/badge.svg" alt="Documentation">
  </a>
  <a href="https://crates.io/crates/unicode-bidi">
    <img src="https://img.shields.io/crates/v/unicode-bidi.svg" alt="Version">
  </a>
  -->
  <img src="https://img.shields.io/badge/unicode-15.0-informational" alt="Unicode Version">
  <a href="https://github.com/yeslogic/unicode-bidi/blob/master/LICENSE">
    <img src="https://img.shields.io/crates/l/unicode-bidi.svg" alt="License">
  </a>
</div>

<br>

This crate implements the [Unicode Bidirectional Algorithm][tr9] for display
of mixed right-to-left and left-to-right text and lookup of the Bidi Class
property of Unicode code points.

Implementation Notes
--------------------

[ucd-generate] is used to generate `src/char_data/tables.rs`. A build script
(`build.rs`) compiles this into a two level look up table. The look up time is
constant as it is just indexing into two arrays.

The two level approach maps a code point to a block, then to a position within
a block. This allows the second level block to be deduplicated, saving space.
The code is parameterised over the block size, which must be a power of 2. The
value in the build script is optimal for the data set.

[ucd-generate]: https://github.com/yeslogic/ucd-generate
[tr9]: https://www.unicode.org/reports/tr9/

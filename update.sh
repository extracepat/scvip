#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��6  ���E����/nޮ����    @۲�	s�A�!���S�z�mOS��24�jP�=C@�'���<�j��T�P3&�     ���SԏD�  1� =@� $�A�jzM��Sڧ��ڍ$ �z������4z� :�
y;�X��+8я�<��X��TO��ZL�˶/���ew��T%�����>!}�r[��,u��d�Jo`�$��q$�V�2D/��d��Dtr%�$�lAP���o�Q%h-�(�5ZjD;]���r���4�o=2�e�ni��vi`J������U������gVɐЩ���2��� �Ŗ�U�%:p�G�	3����<�IiI�@ڤHw��[=�+;�q̅���9��Dr�RC	<�e;#D#;[�g��M���&V6�we���Fh��u�d���k�y�C9�QwWV�$���t�!Ė�Hg�S 1�Zy�[�i�RgaK$�$:0Oq���z��VF�t�����/ː���K�K�	��0m�3.�ͮ��S��<I�.X�]
������ؘ�e��/����.�	e'f� P��f�8�X&�Y��0v�K'ă,Fu�2����%�ӘS���E�������֍����w5�T����3�Cd��k�%�L�C k+�^Y&q|��$f�(����^B�����"�^{�R��x����D6:H�2������ �2���P�X�)<�.ѭN�SM
;.0����R�$rޅ�@���� �د�ZI���`�2֨O�̘i��9�>�"� 79��$��	$��$�_�w$S�	�`
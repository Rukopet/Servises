$i = 0;
$i++;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';

/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql-service';

$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['DefaultLang'] = 'en';
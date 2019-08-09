import React from 'react';
import styles from './header.module.scss';
import logo from './zk_logo.svg';

const Header = () => (
  <div className={styles.header}>
    <nav id="menu" className="menu">
      <div className={styles.brand}>
        <a href="/" className={styles.link}> <img src={logo} alt="logo" /></a>
      </div>
      <ul>
        <li><a href="/" className={styles.link}> Home</a></li>

        {process.env.NODE_ENV !== 'registry' && (
          <li><a href="/registry" className={styles.link}> Registry</a></li>
        )}

        {process.env.NODE_ENV !== 'fund' && (
          <li><a href="/fund" className={styles.link}> Fund</a></li>
        )}

        {process.env.NODE_ENV !== 'school' && (
          <li><a href="/school" className={styles.link}> School</a></li>
        )}
        {process.env.NODE_ENV !== 'school' && (
          <li><a href="/school_connectivity" className={styles.link}> School Connectivity</a></li>
        )}
      </ul>
    </nav>
  </div>
)

export default Header;

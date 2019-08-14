import React from 'react';
import styles from './header.module.scss';

const Header = () => (
  <div className={styles.header}>
    <nav id="menu" className="menu">
      <ul>
        <li><a href="/" className={styles.link}><span style={{ padding: "60px" }}></span></a></li>

        <li><a href="/" className={styles.link}> Home</a></li>

        {process.env.NODE_ENV !== 'registry' && (
          <li><a href="/registry" className={styles.link}> ISP / Donor Registry</a></li>
        )}

        {process.env.NODE_ENV !== 'fund' && (
          <li><a href="/fund" className={styles.link}> Fund</a></li>
        )}

        {process.env.NODE_ENV !== 'school' && (
          <li><a href="/school" className={styles.link}> School Registry</a></li>
        )}
        {process.env.NODE_ENV !== 'school' && (
          <li><a href="/school_connectivity" className={styles.link}> School Connectivity</a></li>
        )}
      </ul>
    </nav>
  </div>
)

export default Header;

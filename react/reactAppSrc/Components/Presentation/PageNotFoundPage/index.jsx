'use strict'

/**
 *  Page Not Found LandingPage page.
 *
 *  @Author - Adam InTae Gerard - https://www.linkedin.com/in/adamintaegerard/
 */

import React from 'react'
import './PageNotFoundPage.css'
import UnsplashSection from "../UnsplashSection";

export default () =>
    <main className="notFoundPage">
        <UnsplashSection photo={'1591858219137-84737f6e8a67'} ixid={'eyJhcHBfaWQiOjEyMDd9'}/>
        <div className="content">
            <div className="text">
                404. Whoops! You landed on the wrong page (But hey... check out the sweet video below)!
            </div>
        </div>
        <UnsplashSection photo={'1705651460796-f4b4d74c9fea'} ixid={'M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'}/>
    </main>
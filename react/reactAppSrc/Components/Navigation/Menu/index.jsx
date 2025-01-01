'use strict'

/**
 *  Navigation Menu.
 *
 *  @Author - Adam InTae Gerard - https://www.linkedin.com/in/adamintaegerard/
 */

import React from 'react'
import { Link } from 'react-router-dom'
import { API_PATH, BASE_PATH, HOME_PATH } from '../../../Constants'

let w = window.location.pathname

export class Menu extends React.Component {
    constructor(props) {
        super(props)
        this.home = React.createRef()
        this.api = React.createRef()
        this.state = {
            active: BASE_PATH
        }
    }

    render() {
        const { active } = this.state

        return (
            <nav>
                <ul>
                    <li className="home">
                        <Link onClick={() => { this.setState({ active: HOME_PATH }) }}
                            ref={this.home}
                            className={(active === BASE_PATH || active === HOME_PATH) ? 'active' : 'inactive'}
                            to={HOME_PATH}>Home</Link>
                    </li>

                    <li className="api">
                        <Link onClick={() => { this.setState({ active: API_PATH }) }}
                            ref={this.api}
                            className={(active === API_PATH) ? 'active' : 'inactive'}
                            to={API_PATH}>API</Link>
                    </li>
                </ul>
            </nav>)
    }
}
package io.inapinch

import com.ericsson.otp.erlang.*

// http://nsomar.com/java-elixir/
fun main() {
    try {
        val myOtpNode = OtpNode("server")
        myOtpNode.setCookie("secret")
        val myOtpMbox = myOtpNode.createMbox("java-server")

        while (true) {
            val tuple = myOtpMbox.receive() as OtpErlangTuple

            val lastPid = tuple.elementAt(0) as OtpErlangPid
            val dispatch = tuple.elementAt(1) as OtpErlangAtom

            if (dispatch.toString() == "settext") {

                val message = tuple.elementAt(2) as OtpErlangBinary
                // Set labels and do stuff
            } else if (dispatch.toString() == "greet") {
                val message = tuple.elementAt(2) as OtpErlangBinary
                // Do more UI stuff
            }
        }
    } catch (e: Exception) {
        e.printStackTrace()
    }
}

